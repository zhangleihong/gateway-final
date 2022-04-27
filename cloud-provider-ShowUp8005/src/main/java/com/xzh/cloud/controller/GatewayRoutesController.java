package com.xzh.cloud.controller;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xzh.cloud.common.Result;
import com.xzh.cloud.config.RedisConfig;
import com.xzh.cloud.entity.GatewayRoutes;
import com.xzh.cloud.entity.Route;
import com.xzh.cloud.service.IGatewayRoutesService;
import com.xzh.cloud.service.IRoutesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/gateway-routes")
public class GatewayRoutesController {

    @Autowired
    private IRoutesService routesService;

    @Autowired
    private IGatewayRoutesService gatewayRoutesService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 获取所有动态路由信息
     *
     * @return
     */
    @RequestMapping("/routes")
    @ResponseBody
    public String getRouteDefinitions() {
        //先从redis中取，再从mysql中取
        String result = redisTemplate.opsForValue().get(RedisConfig.routeKey);
        if (!StringUtils.isEmpty(result)) {
            System.out.println("返回 redis 中的路由信息......");
        } else {
            System.out.println("返回 mysql 中的路由信息......");
            result = JSON.toJSONString(routesService.getRouteDefinitions());
            //再set到redis
            redisTemplate.opsForValue().set(RedisConfig.routeKey, result);
        }
        System.out.println("路由信息：" + result);
        return result;
    }


    //添加路由信息
    @PostMapping("/save")
    @ResponseBody
    public Result add(@RequestBody GatewayRoutes route) {
        route.setIsDel(false);
        route.setIsEbl(false);
        return Result.success(gatewayRoutesService.saveOrUpdate(route));
    }


    //修改路由信息
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Result edit(@RequestBody GatewayRoutes route) {
        return Result.success(routesService.update(route));
    }

    //打开路由列表
    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam Integer pageNum,
                       @RequestParam Integer pageSize,
                       @RequestParam(defaultValue = "") String routeUri,
                       @RequestParam(defaultValue = "") String routeOrder) {
        QueryWrapper<GatewayRoutes> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(routeUri)) {
            queryWrapper.like("route_uri", routeUri);
        }
        if (!"".equals(routeOrder)) {
            queryWrapper.like("route_order", routeOrder);
        }
        queryWrapper.eq("is_del",false);
        System.out.println(queryWrapper);
        return Result.success(gatewayRoutesService.page(new Page<>(pageNum, pageSize), queryWrapper));

    }

    @DeleteMapping("/{id}")
    @ResponseBody
    public Result delete(@PathVariable Long id) {
        return Result.success(routesService.delete(id, true));
    }
}
