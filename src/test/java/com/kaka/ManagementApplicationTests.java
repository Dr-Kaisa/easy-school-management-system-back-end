package com.kaka;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ManagementApplicationTests {
	public static final Logger log = LoggerFactory.getLogger(ManagementApplication.class);
	@Test
	public void contextLoads() {
		log.trace("trace 级别测试");
		log.debug("debug 级别测试");
		log.info("info 级别测试");
		log.warn("warn 级别测试");
		log.error("errorkakakak 级别测试");

	}

}
