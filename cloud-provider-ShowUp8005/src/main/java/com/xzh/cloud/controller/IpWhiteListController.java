package com.xzh.cloud.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xzh.cloud.common.Result;
import com.xzh.cloud.entity.IpWhiteList;
import com.xzh.cloud.entity.Ips;
import com.xzh.cloud.entity.Route;
import com.xzh.cloud.entity.TopData;
import com.xzh.cloud.service.IpService;
import com.xzh.cloud.service.IpWhiteListService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Comparator;
import java.util.List;


@RestController
@RequestMapping("/whiteList")
public class IpWhiteListController {
//
//    @Value("${files.upload.path}")
//    private String filesUploadPath;
//    @Value("${server.port}")
//    private String serverPort;

    @Resource
    private IpWhiteListService ipWhiteListService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody IpWhiteList ipWhiteList) {
        List<IpWhiteList> list = ipWhiteListService.selectByIp(ipWhiteList.getIp());
        if(list.size()>0){
            return Result.error("500","ip已存在");
        }
        return Result.success(ipWhiteListService.saveOrUpdate(ipWhiteList));
    }

    @PostMapping("/changeFlag")
    public Result changeFlag(@RequestBody int id) {
//        String s = "sdf";
        ipWhiteListService.changeFlag(id);
        return Result.success();
    }

    @PostMapping("/selectFlag")
    public Result selectFlag(@RequestBody int id) {
        System.out.println(222);
        return Result.success(ipWhiteListService.selectFlag(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String ip) {

        QueryWrapper<IpWhiteList> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(ip)) {
            queryWrapper.like("ip", ip);
        }

        return Result.success(ipWhiteListService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }


    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(ipWhiteListService.removeById(id));
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(ipWhiteListService.removeByIds(ids));
    }

//    @GetMapping
//    public Result findAll() {
//        return Result.success(ipWhiteListService.list());
//    }
//
//    @GetMapping("/ip/{ip}")
//    public Result findByIp(@PathVariable String ip) {
//        QueryWrapper<IpWhiteList> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("ip", ip);
//        return Result.success(ipWhiteListService.getOne(queryWrapper));
//    }

}

