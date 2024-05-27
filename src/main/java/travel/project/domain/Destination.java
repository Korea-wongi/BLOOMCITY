package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Destination {
    private long destinationId;
    private String destinationName;
    private String country;
    private String destinationDescription;	// 열명 변경
    private String destinationAlias;	// 열명 변경
    
    
}
