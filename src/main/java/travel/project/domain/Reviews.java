package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Reviews {
    private long reviewId;
    private String customerId;
    private long packId;
    private int rating; // 리뷰 평점
    private String comments;

}
