package com.grad.iotivity.model;

import java.util.ArrayList;

public interface LightDAO {

	// 모든 정보 가져오기
	public ArrayList<LightDTO> selectAll();

	// 가장 최근 정보 가져오기
	public LightDTO selectOne();

	public ArrayList<LightDTO> selectThree();
	
	// 데이터 insert
	public int insert(LightDTO lightDTO);

	// modify
	public int modify(LightDTO lightDTO);

	// delete
	public int delete(LightDTO lightDTO);

}
