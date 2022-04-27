package com.xzh.cloud.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xzh.cloud.common.Constants;
import com.xzh.cloud.common.Result;
import com.xzh.cloud.controller.dto.UserDTO;
import com.xzh.cloud.controller.dto.UserPasswordDTO;
import com.xzh.cloud.entity.Ips;
import com.xzh.cloud.entity.TopData;
import com.xzh.cloud.entity.User;
import com.xzh.cloud.service.IUserService;
import com.xzh.cloud.service.IpService;
import com.xzh.cloud.utils.IpUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/data")
public class IpController {
//
//    @Value("${files.upload.path}")
//    private String filesUploadPath;
    @Value("${server.port}")
    private String serverPort;

    @Resource
    private IpService ipService;

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String ip,
                           @RequestParam(defaultValue = "") String port) {

        QueryWrapper<Ips> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(ip)) {
            queryWrapper.like("ip", ip);
        }
        if (!"".equals(port)) {
            queryWrapper.like("port", port);
        }

        return Result.success(ipService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }


    @GetMapping("/top")
    public TopData topShowUp() {
        List<Ips> list = ipService.selectAllIp();
        Integer userCount=1, visitCount=0, portCount=1,userTemp=0,portTemp=0;
        visitCount = list.size();

        list.sort(new Comparator<Ips>() {
            @Override
            public int compare(Ips o1, Ips o2) {
                Integer i1= o1.getPort();
                Integer i2= o2.getPort();
                return i1.compareTo(i2);
            }
        });
        for(int i=0;i<(list.size()-1);i++){
            for(int j=i+1;j<(list.size());j++){
                if(!(list.get(i).getPort().equals(list.get(j).getPort()))){
                    portCount++;
                    i=j;j++;
                }
            }
        }

        list.sort(new Comparator<Ips>() {
            @Override
            public int compare(Ips o1, Ips o2) {
                String i1= o1.getIp();
                String i2= o2.getIp();
                return i1.compareTo(i2);
            }
        });

        for(int i=0;i<(list.size()-1);i++){
            for(int j=i+1;j<(list.size());j++){
                if(!(list.get(i).getIp().equals(list.get(j).getIp()))){
                    userCount++;
                    i=j;j++;
                }
            }
        }
        TopData topData = new TopData();
        topData.setPortCount(portCount);
        topData.setUserCount(userCount);
        topData.setVisitCount(visitCount);

        return topData;
    }


    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(ipService.removeById(id));
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(ipService.removeByIds(ids));
    }

    @GetMapping
    public Result findAll() {
        return Result.success(ipService.list());
    }

    @GetMapping("/ip/{ip}")
    public Result findByIp(@PathVariable String ip) {
        QueryWrapper<Ips> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("ip", ip);
        return Result.success(ipService.getOne(queryWrapper));
    }

}

