package com.xzh.cloud.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.cloud.controller.dto.UserPasswordDTO;
import com.xzh.cloud.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 青哥哥
 * @since 2022-01-26
 */

public interface UserMapper extends BaseMapper<User> {

    @Update("update sys_user set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(UserPasswordDTO userPasswordDTO);

}
