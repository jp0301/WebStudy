/*===============================================
 * MemberScoreDTO.java
 *  - 객체 전용 (데이터 보관 및 전송) → JAVA BEAN
 *=============================================== */


package com.test;

public class MemberScoreDTO
{
	// VIEW_MEMBERSCORE 조회 항목을 기준으로
	// 프로퍼티(Property) 구성
	private String sid, name;
	private int kor, eng, mat;
	private int tot;
	private double avg;
	private int rank;
	
	
	
	public String getSid()
	{
		return sid;
	}
	public void setSid(String sid)
	{
		this.sid = sid;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

	public int getKor()
	{
		return kor;
	}
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	public int getEng()
	{
		return eng;
	}
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	public int getMat()
	{
		return mat;
	}
	public void setMat(int mat)
	{
		this.mat = mat;
	}
	public int getTot()
	{
		return tot;
	}
	public void setTot(int tot)
	{
		this.tot = tot;
	}
	public double getAvg()
	{
		return avg;
	}
	public void setAvg(double avg)
	{
		this.avg = avg;
	}
	public int getRank()
	{
		return rank;
	}
	public void setRank(int rank)
	{
		this.rank = rank;
	}
	
	
	
}
