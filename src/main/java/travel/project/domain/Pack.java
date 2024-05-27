package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class Pack {
    private long packId;
    private String packName;
    private String 	destinationName;
    private String packType;
    private Date startDate; // startDate와 endDate는 트리거로 insert, update시 검증
    private Date endDate;
    private int price;
    private String destinationAlias;
}
