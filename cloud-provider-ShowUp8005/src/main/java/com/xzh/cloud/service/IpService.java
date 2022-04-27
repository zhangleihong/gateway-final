package com.xzh.cloud.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.cloud.entity.Ips;
import com.xzh.cloud.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IpService extends IService<Ips> {
    void insertIp(Ips ip);

    List<Ips> selectByIp(@Param("ip") String ip);

    List<Ips> selectAllIp();
}
