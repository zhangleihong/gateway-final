package com.xzh.cloud.service.impl;

import cn.hutool.log.Log;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.cloud.entity.Menu;
import com.xzh.cloud.entity.Route;
import com.xzh.cloud.mapper.RoleMapper;
import com.xzh.cloud.mapper.RoleMenuMapper;
import com.xzh.cloud.mapper.RouteMapper;
import com.xzh.cloud.service.IMenuService;
import com.xzh.cloud.service.IRouteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 青哥哥
 * @since 2022-01-26
 */
@Service
public class RouteServiceImpl extends ServiceImpl<RouteMapper, Route> implements IRouteService {

}
