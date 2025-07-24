package net.dstone.batch.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.tuxdevelop.spring.batch.lightmin.repository.annotation.EnableLightminJdbcConfigurationRepository;
import org.tuxdevelop.spring.batch.lightmin.repository.server.configuration.EnableLightminRepositoryServer;
import org.tuxdevelop.spring.batch.lightmin.server.annotation.EnableLightminServer;
import org.tuxdevelop.spring.batch.lightmin.server.scheduler.repository.annotation.EnableServerSchedulerJdbcRepository;

@SpringBootApplication 
@EnableLightminServer                       // Lightmin 서버 (UI) 활성화
@EnableServerSchedulerJdbcRepository        // 스케줄러 설정을 DB(JDBC) 저장
@EnableLightminRepositoryServer             // 원격 JobConfiguration 저장소 서버 활성화
@EnableLightminJdbcConfigurationRepository  // JobConfiguration을 DB에 저장
public class DstoneBatchServer {

	public static boolean IS_SYS_PROPERTIES_SET = false;
	@SuppressWarnings("rawtypes")
	public static void setSysProperties() {
		if(!IS_SYS_PROPERTIES_SET) {
			IS_SYS_PROPERTIES_SET = true;
			StringBuffer msg = new StringBuffer();
			try {
				msg.append("/******************************* env.properties System변수로 세팅 하기위한 조치 시작 *********************************/").append("\n");
				java.net.URL resource = DstoneBatchServer.class.getClassLoader().getResource("env.properties");
				if (resource != null) {
			        try (InputStream input = resource.openStream()) {
			        	Properties props = new Properties();
			            if (input == null) {
			            	msg.append("Unable to find config.properties").append("\n");
			            }else {
				            props.load(input);
							String key = "";
							String val = "";
				            java.util.Iterator keys = props.keySet().iterator();
				            while( keys.hasNext() ) {
								key = (String)keys.next();
								val = props.getProperty(key, "");
								System.setProperty(key, val);
								msg.append("시스템프로퍼티 "+key+"["+val+"]").append("\n");
				            }
			            }

			        } catch (IOException ex) {
			            ex.printStackTrace();
			        }
				}
				msg.append("/******************************* env.properties System변수로 세팅 하기위한 조치 끝  *********************************/").append("\n");

				System.out.println(msg.toString());
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
	public static void main(String[] args) {

		/*** env.properties의 항목들을 System변수로 세팅 ***/
		setSysProperties();
		
		SpringApplication app = new SpringApplication(DstoneBatchServer.class);
	    app.run(args);
	}
	
}
