package com.xzh.cloud.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.cloud.controller.dto.UserDTO;
import com.xzh.cloud.controller.dto.UserPasswordDTO;
import com.xzh.cloud.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 青哥哥
 * @since 2022-01-26
 */
public interface IUserService extends IService<User> {

    UserDTO login(UserDTO userDTO);

    User register(UserDTO userDTO);

    void updatePassword(UserPasswordDTO userPasswordDTO);
}
