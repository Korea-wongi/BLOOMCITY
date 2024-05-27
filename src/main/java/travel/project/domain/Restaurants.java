package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Restaurants {
    private long restaurantId;
    private long destinationId;
    private String restaurantName; // 열명 변경
    private String cuisine;
    private String restaurantDescription; // 열명 변경

}
