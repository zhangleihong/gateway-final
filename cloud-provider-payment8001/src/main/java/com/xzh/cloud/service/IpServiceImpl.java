package com.xzh.cloud.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.cloud.entities.Ips;
import com.xzh.cloud.dao.IpMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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
