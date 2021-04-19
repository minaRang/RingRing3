package com.dessert.ringring.config;

import lombok.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver multipartResolver= new CommonsMultipartResolver();
        multipartResolver.setDefaultEncoding("UTF-8"); //인코딩 설정
        multipartResolver.setMaxUploadSizePerFile(5 * 1024 * 1024); //파일당 업로드 크기 제한:5mb
        return multipartResolver;
    }
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/static/upload/**")
                .addResourceLocations("file:////var/lib/jenkins/area_deploy/ringring/upload-images/upload/");
    }
}
