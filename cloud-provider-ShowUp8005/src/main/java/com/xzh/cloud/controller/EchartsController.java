package com.xzh.cloud.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.Quarter;
import com.xzh.cloud.common.Result;
import com.xzh.cloud.entity.Ips;
import com.xzh.cloud.entity.User;
import com.xzh.cloud.service.IUserService;
import com.xzh.cloud.service.IpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.*;

@RestController
@RequestMapping("/echarts")
public class EchartsController {

    @Resource
    private IUserService userService;

    @Resource
    private IpService ipService;
    //zlh
    @GetMapping("/portCount")
    public Result portCount(@RequestParam(defaultValue = "") String startTime,
                          @RequestParam(defaultValue = "") String endTime) {
        List<Ips> list = ipService.list();
        if(startTime.length() != 0&&endTime.length() != 0) {
            startTime = startTime.substring(0,10);
            endTime = endTime.substring(0,10);
            Iterator<Ips> iterator = list.iterator();
            while (iterator.hasNext()) {
                Ips item = iterator.next();
                if (item.getVisitTime().substring(0, 10).compareTo(startTime) < 0 || item.getVisitTime().substring(0, 10).compareTo(endTime) > 0) {
                    iterator.remove();
                }
            }
        }
        HashMap<Integer, Integer> hm = new HashMap<>();
        for(Ips ips : list){
            //hm[ips.getPort().toString()]++;
            Integer count = hm.get(ips.getPort());
            hm.put(ips.getPort(),count == null?1:++count);

        }
        List<Integer> strs = new ArrayList<>();
        List<Integer> ints = new ArrayList<>();
        for(Integer key : hm.keySet()){
            strs.add(key);
            ints.add(hm.get(key));
        }
        List<List> doubleList = new ArrayList<>();
        doubleList.add(strs);
        doubleList.add(ints);
        return Result.success(doubleList);
    }

    @GetMapping("/uriCount")
    public Result uriCount(@RequestParam(defaultValue = "") String startTime,
                          @RequestParam(defaultValue = "") String endTime) {
        List<Ips> list = ipService.list();
        if(startTime.length() != 0&&endTime.length() != 0) {
            startTime = startTime.substring(0,10);
            endTime = endTime.substring(0,10);
            Iterator<Ips> iterator = list.iterator();
            while (iterator.hasNext()) {
                Ips item = iterator.next();
                if (item.getVisitTime().substring(0, 10).compareTo(startTime) < 0 || item.getVisitTime().substring(0, 10).compareTo(endTime) > 0) {
                    iterator.remove();
                }
            }
        }
        HashMap<String, Integer> hm = new HashMap<>();
        for(Ips ips : list){
            //hm[ips.getPort().toString()]++;
            Integer count = hm.get(ips.getRequestUri());
            hm.put(ips.getRequestUri(),count == null?1:++count);

        }
        List<String> uriList = new ArrayList<>();
        List<Integer> countList = new ArrayList<>();
        for(String key : hm.keySet()){
            uriList.add(key);
            countList.add(hm.get(key));
        }
        List<List> doubleList = new ArrayList<>();
        doubleList.add(uriList);
        doubleList.add(countList);
        return Result.success(doubleList);
    }
    @GetMapping("/ipCount")
    public Result ipCount(@RequestParam(defaultValue = "") String startTime,
                          @RequestParam(defaultValue = "") String endTime) {
        List<Ips> list = ipService.list();
        if(startTime.length() != 0&&endTime.length() != 0) {
            startTime = startTime.substring(0,10);
            endTime = endTime.substring(0,10);
            Iterator<Ips> iterator = list.iterator();
            while (iterator.hasNext()) {
                Ips item = iterator.next();
                if (item.getVisitTime().substring(0, 10).compareTo(startTime) < 0 || item.getVisitTime().substring(0, 10).compareTo(endTime) > 0) {
                    iterator.remove();
                }
            }
        }
        HashMap<String, Integer> hm = new HashMap<>();
        for(Ips ips : list){
            //hm[ips.getPort().toString()]++;
            Integer count = hm.get(ips.getIp());
            hm.put(ips.getIp(),count == null?1:++count);

        }
        List<String> ipList = new ArrayList<>();
        List<Integer> countList = new ArrayList<>();
        for(String key : hm.keySet()){
            ipList.add(key);
            countList.add(hm.get(key));
        }
        List<List> doubleList = new ArrayList<>();
        doubleList.add(ipList);
        doubleList.add(countList);
        return Result.success(doubleList);
    }
}
