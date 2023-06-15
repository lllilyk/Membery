package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface PetsitterCommentMapper {
	
	@Select("""
			SELECT * FROM PetsitterComment WHERE detailId = #{detailId} ORDER BY id
			""")
	List<PetsitterComment> selectAllByDetailId(Integer detailId);
	
	@Insert("""
			INSERT INTO PetsitterComment 
				(detailId, body, memberId)
			VALUES
				(#{detailId}, #{body}, #{memberId})
			""")
	Integer insert(PetsitterComment petsitterComment);
	
}