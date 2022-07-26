package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;
import com.itbank.board.ReplyDAO;
import com.itbank.board.ReplyDTO;

@Service
public class BoardService {
	
	@Autowired private BoardDAO boardDAO;
	@Autowired private ReplyDAO replyDAO;
	
	private String uploadPath = "D:\\upload";
	
	public BoardService() {
		File dir = new File(uploadPath);
		if(dir.exists() && dir.isFile()) {	// 대상이 존재하는데 디렉토리가 아니고, 파일형식이면
			dir.delete();					// 삭제 한다
		}
		if(dir.exists() == false) {			// 대상이 존재하지 않는다면
			dir.mkdirs();					// 디렉토리 형식으로 생성한다
			// mkdir : 대상 디렉토리를 생성한다. 중간 경로가 없다면 생성할 수 없다				(mkdir)
			// mkdirs : 대상 디렉토리를 생성한다. 중간 경로가 없다면 중간경로까지 포함하여 생성한다(mkdir -p)
		}
	}

	public List<BoardDTO> selectList(HashMap<String, Object> param) {
		return boardDAO.selectList(param);
	}

	public BoardDTO selectOne(int idx) {
		BoardDTO dto = boardDAO.selectOne(idx);		// 글 하나를 불러온다
		return dto;
	}

	public int write(BoardDTO dto) throws IllegalStateException, IOException {
		// 1) 파일 이름을 변경해보자 (연-월-일_userid_원본이름.확장자)
		String fileName = makeNewFileName(dto);
		File dest = new File(uploadPath, fileName);
		dto.getUpload().transferTo(dest); 		// 파일 이름 변경된 상태로 업로드 완료

		// 업로드 파일이 없으면 업로드 파일이름에 빈문자열
		boolean flag = "".equals(dto.getUpload().getOriginalFilename());
		dto.setUploadFile(flag ? "" : fileName);
		
		// 2) DB에 insert
		int row  = boardDAO.insert(dto);				
		return row;
	}

	public void updateViewCount(int idx) {
		boardDAO.updateViewCount(idx);
	}

	public int delete(int idx) {
		return boardDAO.updateDeleted(idx);
	}

	public int modify(BoardDTO dto) throws IllegalStateException, IOException {
		if("".equals(dto.getUpload().getOriginalFilename()) == false) {
			File dest = new File(uploadPath, makeNewFileName(dto));
			dto.getUpload().transferTo(dest); 	// 새로 업로드된 파일을 먼저 생성하고
			dto.setUploadFile(dest.getName()); 	// 업로드된 파일의 이름을 dto에 setting
//			return boardDAO.updateWithFile(dto);// 파일의 이름을 함께 업데이트 한다
		}
		return boardDAO.update(dto);
	}
	
	private String makeNewFileName(BoardDTO dto) {
		MultipartFile f = dto.getUpload();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		String fileName = today + "_" + dto.getWriter() + "_" + f.getOriginalFilename();
		return fileName;
	}

	public int selectBoardCount(HashMap<String, Object> param) {
		// boardCount : select count(*) from board2 where (...) and deleted != 'y';
		int boardCount = boardDAO.selectBoardCount(param);
		return boardCount;
	}

	public List<ReplyDTO> selectReplyList(int idx) {
		return replyDAO.selectList(idx);	// reply의 idx가 아니고, board의 idx
	}

	public int insertReply(ReplyDTO dto) {
		return replyDAO.insert(dto);
	}

	public int replyDelete(int idx) {
		return replyDAO.replyDelete(idx);
	}

}












