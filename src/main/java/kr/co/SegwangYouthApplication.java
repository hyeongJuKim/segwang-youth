package kr.co;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@EnableJpaAuditing
//@EntityScan(
//		basePackageClasses = {Jsr310JpaConverters.class},  // basePackageClasses에 지정
//		basePackages = {"kr.co.segwang_youth"}) // basePackages도 추가로 반드시 지정해줘야 한다
@SpringBootApplication
public class SegwangYouthApplication {

	public static void main(String[] args) {
		SpringApplication.run(SegwangYouthApplication.class, args);


	}

}
