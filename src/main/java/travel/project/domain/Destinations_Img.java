package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class Destinations_Img {
    private long destinationsImgId;
    private String imgName;
    private String category;
    private long destinationId;
}
