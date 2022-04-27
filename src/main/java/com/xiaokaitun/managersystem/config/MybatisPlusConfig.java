package com.xiaokaitun.managersystem.config;

import com.baomidou.mybatisplus.autoconfigure.ConfigurationCustomizer;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.BlockAttackInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @program: managersystem
 * @description: MyBatisPlus配置类
 * @author: sunzhongkai
 * @create: :2022-04-27 15:54
 **/
@Configuration
@MapperScan("com.xiaokaitun.mapper")
public class MybatisPlusConfig {
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor(){
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        /**
         * 分页插件
         * 一级缓存和二级缓存遵循mybatis的规则，需要设置 MybatisConfiguration#useDeprecatedExecutor = false 避免出现缓存问题
         */
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor());
        // 防止全表更新插件
        interceptor.addInnerInterceptor(new BlockAttackInnerInterceptor());
        return interceptor;
    }

    @Bean
    public ConfigurationCustomizer configurationCustomizer(){
        return configuration -> configuration.setUseDeprecatedExecutor(false);
    }
}
