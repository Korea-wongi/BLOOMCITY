package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AttractionView { // 관광지 목적지에 어떤 관광지가 있는지
    private long attractionId;
    private long destinationId;
    private String attractionName; // 열명 변경
    private String type;
    private String attractionDescription; // 열명 변경
    private String destinationName;
    private String country;

}
