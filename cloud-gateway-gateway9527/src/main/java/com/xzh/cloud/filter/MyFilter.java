package com.xzh.cloud.filter;

import com.xzh.cloud.IpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Date;

@Component
@Slf4j
public class MyFilter implements GlobalFilter, Ordered {
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.info("__________________欢迎光临________________________" + IpUtil.getLocalIP());
        log.info("________________getHeaders______________________" + exchange.getRequest().getHeaders());
        log.info("________________getQueryParams______________________" + exchange.getRequest().getQueryParams());
        log.info("________________getPath______________________" + exchange.getRequest().getPath());
        log.info("________________getURI______________________" + exchange.getRequest().getURI());
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return -1;
    }
}
