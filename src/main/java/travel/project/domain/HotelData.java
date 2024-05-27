package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class HotelData {
	private long hotelId;
	private String hotelName;
	private String destinationName;
	private int starRating; // 몇성급인지
	private String description;
	private long hotelsImgId;
	private String imgName;
}
