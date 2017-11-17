package com.gestionCafeteria.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import gestionCafeteria.converter.RoleToUserProfileConverter;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.gestionCafeteria"})
public class AppConfig extends WebMvcConfigurerAdapter {	
	
	/*@Autowired
	 RoleToUserProfileConverter roleToUserProfileConverter;*/
	
	//jsp view resolver	 
	@Bean
	public ViewResolver jspViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/jsp/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	//Static resources
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}	
	
    /**
     * Configure Converter to be used.
     * In our example, we need a converter to convert string values[Roles] to UserProfiles in newUser.jsp
     */
	
	@Bean
	public RoleToUserProfileConverter getRoleToUserProfileConverter() {
		return new RoleToUserProfileConverter();
	} 
	
	@Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(getRoleToUserProfileConverter());
    }
    /*@Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(roleToUserProfileConverter);
    }*/
     
 
    /**
     * Configure MessageSource to lookup any validation/error message in internationalized property files
     */
    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        return messageSource;
    }
     
    /**Optional. It's only required when handling '.' in @PathVariables which otherwise ignore everything after last '.' in @PathVaidables argument.
     * It's a known bug in Spring [https://jira.spring.io/browse/SPR-6164], still present in Spring 4.1.7.
     * This is a workaround for this issue.
     */
    /*@Override
    public void configurePathMatch(PathMatchConfigurer matcher) {
        matcher.setUseRegisteredSuffixPatternMatch(true);
    }*/
}