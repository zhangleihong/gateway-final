package com.xzh.cloud.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.cloud.entities.Ips;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IpMapper extends BaseMapper<Ips> {
//    @Insert("insert into sys_ip(ip,time) values (#{ip}, #{time})")
    void insertIp(Ips ips);

//    @Select("select ip,time from sys_ip where ip = #{ip}")
    List<Ips> selectByIp(@Param("ip") String ip);

//    @Select("select ip from sys_ip")
    List<Ips> selectAllIp();
}
