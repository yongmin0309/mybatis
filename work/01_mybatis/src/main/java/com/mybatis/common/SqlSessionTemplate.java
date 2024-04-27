package com.mybatis.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class SqlSessionTemplate {

	public static SqlSession getSession() {
		//SqlSession생성하기
		//1. SqlSessionFactroy클래스에서 제공하는 openSession()메소드를 이용해서 생성
		//	1)SqlSessionFactroy클래스는 SqlSessionFactoryBuilder클래스를 이용해서 생성
		//     SqlSessionFactoryBuilder클래스의 build()메소드를 이용
					//build()메소드의 인수로 mybatis-config.xml파일내용 저달
		
		String fileName="mybatis-config.xml";
		SqlSession session = null;
		
		try {
			//mybatis-config.xml파일에 스트림연결 -> 스트림객체 생성
			//ctrl+shift+o
			
			InputStream is=Resources.getResourceAsStream(fileName);
			
//			SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
//			SqlSessionFactory sf=ssfb.build(is);
//			//openSession메소드의 인수로 boolean형 -> true/false
//			//autoCommit에 대한 설정
//			session=sf.openSession(false);
			
			 session = new SqlSessionFactoryBuilder().build(is).openSession(false);
			
		}catch (IOException e) {
			e.printStackTrace(); //에러로그확인용
		}
		return session;
	}
	
}
