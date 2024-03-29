package cs.dit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cs.dit.domain.CommentsDTO;

public interface CommentsMapper {
	
	public List<CommentsDTO> list(@Param ("bcode") int bcode, @Param ("cri") Criteria cri);
	
	public Boolean insert(@Param ("bcode")int bcode, @Param("content") String content);
}
