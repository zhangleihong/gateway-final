package com.xzh.cloud.service.impl;

import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.cloud.entity.GatewayRoutes;
import com.xzh.cloud.entity.Menu;
import com.xzh.cloud.mapper.GatewayRouteMapper;
import com.xzh.cloud.mapper.RoleMapper;
import com.xzh.cloud.mapper.RoleMenuMapper;
import com.xzh.cloud.mapper.RouteMapper;
import com.xzh.cloud.service.IGatewayRoutesService;
import com.xzh.cloud.service.IMenuService;
import com.xzh.cloud.service.IRouteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class GatewayServiceImpl extends ServiceImpl<GatewayRouteMapper, GatewayRoutes> implements IGatewayRoutesService {
    @Override
    public <E extends IPage<GatewayRoutes>> E page(E page, Wrapper<GatewayRoutes> queryWrapper) {

        return this.getBaseMapper().selectPage(page, queryWrapper);
    }
}
