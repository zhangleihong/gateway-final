package com.zypcy.springcloud.dynamicroute.service.impl;

import com.zypcy.springcloud.dynamicroute.dto.GatewayRouteDefinition;
import com.zypcy.springcloud.dynamicroute.entity.GatewayRoutes;
import com.zypcy.springcloud.dynamicroute.respository.GatewayRoutesMapper;
import com.zypcy.springcloud.dynamicroute.service.inf.IRoutesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RoutesServiceImpl implements IRoutesService {

    @Autowired
    private GatewayRoutesMapper mapper;

    @Override
    public int add(GatewayRoutes route) {
        route.setIsEbl(false);
        route.setIsDel(false);
        route.setCreateTime(new Date());
        route.setUpdateTime(new Date());
        return mapper.insertSelective(route);
    }

    @Override
    public int update(GatewayRoutes route) {
        route.setUpdateTime(new Date());
        return mapper.updateByPrimaryKeySelective(route);
    }

    @Override
    public int delete(Long id, boolean isDel) {
        return mapper.deleteByPrimaryKey(id, isDel);
    }

    @Override
    public int enableById(Long id, boolean isEbl) {
        return mapper.enableById(id, isEbl);
    }

    @Override
    public GatewayRoutes getById(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    /**
     * 查询路由信息
     *
     * @return
     */
    @Override
    public List<GatewayRoutes> getRoutes(GatewayRoutes route) {
        return mapper.getRoutes(route);
    }

    /**
     * 返回组装后网关需要的路由信息
     *
     * @return
     */
    @Override
    public List<GatewayRouteDefinition> getRouteDefinitions() {
        List<GatewayRouteDefinition> routeDefinitions = new ArrayList<>();
        GatewayRoutes route = new GatewayRoutes();
        route.setIsDel(false);
        route.setIsEbl(false);
        List<GatewayRoutes> routes = getRoutes(route);
        for (GatewayRoutes gatewayRoute : routes) {
            GatewayRouteDefinition routeDefinition = new GatewayRouteDefinition();
            routeDefinition.setId(gatewayRoute.getRouteId());
            routeDefinition.setUri(gatewayRoute.getRouteUri());
            routeDefinition.setFilters(gatewayRoute.getFilterDefinition());
            routeDefinition.setPredicates(gatewayRoute.getPredicateDefinition());
            routeDefinitions.add(routeDefinition);
        }
        return routeDefinitions;
    }
}
