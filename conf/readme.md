## 配置文件相关
> * 读取配置文件
 
    `@PropertySource("classpath:prop.properties")` 
 
 表示当前类将读取 `resource` 文件夹下面的 `prop.properties` 文件内容，默认值是当前项目使用的配置文件。
 
    `@Value("${web.file.path}")`
 
 读取配置文件中的 `web.file.path` 属性，即 /usr/local/
 
> * 切换配置文件
    
    `spring.profiles.active=dev`

 当有多个配置文件时，使用不同的文件作为配置文件，比如分为开发环境、测试环境、生产环境等，这里使用的配置文件是 `application-dev.properties`