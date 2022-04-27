package com.xzh.cloud.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.cloud.entity.Ips;
import com.xzh.cloud.entity.User;
import com.xzh.cloud.mapper.IpMapper;
import com.xzh.cloud.mapper.UserMapper;
import com.xzh.cloud.service.IpService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Service
public class IpServiceImpl extends ServiceImpl<IpMapper, Ips> implements IpService {

    @Resource
    IpMapper ipMapper;

    @Override
    public void insertIp(Ips ips) {
        ipMapper.insertIp(ips);
    }

    @Override
    public List<Ips> selectByIp(@Param("id") String ip) {
        List<Ips> ips = new ArrayList<>();
        ips = ipMapper.selectByIp(ip);
        return ips;
    }

    @Override
    public List<Ips> selectAllIp() {
        List<Ips> ips = new ArrayList<>();
        ips = ipMapper.selectAllIp();
        return ips;
    }
}
