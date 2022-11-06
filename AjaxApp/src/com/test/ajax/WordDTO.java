package com.test.ajax;

public class WordDTO
{
	// 주요 속성 구성
	// : 추우 DB의 규모가 커지거나 추가 정책이 붙는다면
	//   둘 이상의 속성을 사용하게 될 수도 있다!! (날짜, 검색횟수 등)
	private String word;
	
	// 디폴트 생성자
	public WordDTO()
	{
		this("");
	}
	
	// 사용자 정의 생성자(매개변수)
	public WordDTO(String word)
	{
		this.word = word;
	}

	public String getWord()
	{
		return word;
	}

	public void setWord(String word)
	{
		this.word = word;
	}

}
