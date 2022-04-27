package com.xzh.cloud.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xzh.cloud.common.Result;
import com.xzh.cloud.entity.Route;
import com.xzh.cloud.service.IRouteService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 青哥哥
 * @since 2022-01-26
 */
@RestController
@RequestMapping("/route")
public class RouteController {

    @Value("${files.upload.path}")
    private String filesUploadPath;

    @Resource
    private IRouteService routeService;



    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Route route) {
        return Result.success(routeService.saveOrUpdate(route));
    }



    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(routeService.removeById(id));
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(routeService.removeByIds(ids));
    }

    @GetMapping
    public Result findAll() {
        return Result.success(routeService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(routeService.getById(id));
    }


    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                               @RequestParam Integer pageSize,
                               @RequestParam(defaultValue = "") String uri,
                               @RequestParam(defaultValue = "") String ordered) {
        System.out.println("开始");

        QueryWrapper<Route> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(uri)) {
            queryWrapper.like("uri", uri);
        }
        if (!"".equals(ordered)) {
            queryWrapper.like("ordered", ordered);
        }
        return Result.success(routeService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
     * 导出接口
     */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Route> list = routeService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("uri", "路由地址");
        writer.addHeaderAlias("predicates", "断言");
        writer.addHeaderAlias("filters", "过滤器");
        writer.addHeaderAlias("ordered", "优先级");
        writer.addHeaderAlias("description", "描述");
        writer.addHeaderAlias("createTime", "创建时间");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("用户信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    /**
     * excel 导入
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 方式1：(推荐) 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
//        List<route> list = reader.readAll(route.class);

        // 方式2：忽略表头的中文，直接读取表的内容
        List<List<Object>> list = reader.read(1);
        List<Route> routes = CollUtil.newArrayList();
        for (List<Object> row : list) {
            Route route = new Route();
            route.setUri(row.get(0).toString());
            route.setPredicates(row.get(1).toString());
            route.setFilters(row.get(2).toString());
            route.setOrdered(row.get(3).toString());
            route.setDescription(row.get(4).toString());
            routes.add(route);
        }

        routeService.saveBatch(routes);
        return Result.success(true);
    }

}

