package com.xzh.cloud.controller;

import com.xzh.cloud.common.Result;
import com.xzh.cloud.config.RedisConfig;
import com.xzh.cloud.entity.DynamicVersion;
import com.xzh.cloud.service.IDynamicVersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/version")
public class DynamicVersionController {

    @Autowired
    private IDynamicVersionService dynamicVersionService;
    @Autowired
    private StringRedisTemplate redisTemplate;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public Result add(ModelMap map) {
        DynamicVersion version = new DynamicVersion();
        int result = dynamicVersionService.add(version);
        return Result.success(result);
    }

    //获取最后一次发布的版本号
    @RequestMapping(value = "/lastVersion", method = RequestMethod.GET)
//    @ResponseBody
    public Long getLastVersion() {
        Long versionId = 0L;
        String result = redisTemplate.opsForValue().get(RedisConfig.versionKey);
        if (!StringUtils.isEmpty(result)) {
            System.out.println("返回 redis 中的版本信息......");
            versionId = Long.valueOf(result);
        } else {
            System.out.println("返回 mysql 中的版本信息......");
            versionId = dynamicVersionService.getLastVersion();
            redisTemplate.opsForValue().set(RedisConfig.versionKey, String.valueOf(versionId));
        }
        return versionId;
    }


    //打开发布版本列表页面
    public String listAll(ModelMap map) {
        map.addAttribute("list", dynamicVersionService.listAll());
        return "versionlist";
    }
}
