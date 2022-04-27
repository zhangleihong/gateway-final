package com.xzh.cloud.service.impl;

import com.alibaba.fastjson.JSON;
import com.xzh.cloud.config.RedisConfig;
import com.xzh.cloud.entity.DynamicVersion;
import com.xzh.cloud.mapper.DynamicVersionMapper;
import com.xzh.cloud.service.IDynamicVersionService;
import com.xzh.cloud.service.IRoutesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class DynamicVersionServiceImpl implements IDynamicVersionService {

    @Autowired
    private DynamicVersionMapper mapper;
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Autowired
    private IRoutesService routesService;

    @Override
    public int add(DynamicVersion version) {
        version.setCreateTime(new Date());
        int result = mapper.insertSelective(version);

        //发布时，把版本信息与路由信息存入redis
        redisTemplate.opsForValue().set(RedisConfig.versionKey, String.valueOf(version.getId()));
        redisTemplate.opsForValue().set(RedisConfig.routeKey, JSON.toJSONString(routesService.getRouteDefinitions()));

        return result;
    }

    @Override
    public int update(DynamicVersion version) {
        return mapper.updateByPrimaryKeySelective(version);
    }

    @Override
    public int delete(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    /**
     * 获取最后一次发布的版本号
     *
     * @return
     */
    @Override
    public Long getLastVersion() {
        return mapper.getLastVersion();
    }

    @Override
    public List<DynamicVersion> listAll() {
        return mapper.listAll();
    }
}
