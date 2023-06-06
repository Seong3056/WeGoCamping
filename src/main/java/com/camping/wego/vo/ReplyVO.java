package com.camping.wego.vo;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE reply(
	rno INT PRIMARY KEY AUTO_INCREMENT,
    bno INT,
    
    FOREIGN KEY (bno)
    REFERENCES board(bno)
    ON DELETE CASCADE,
    
    user_id VARCHAR(50),
    
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE,
    
    reply VARCHAR(1000),
    reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL
);
 */

@Getter @Setter @ToString
public class ReplyVO {
	
	private int rno, bno;
	
	private String reply, userId;
	
	private LocalDateTime replyDate, updateDate;

}
