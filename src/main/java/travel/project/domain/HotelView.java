package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class HotelView {
	private long hotelId;
	private String hotelName;
	private String destinationName;
	private String starRating;
	private String description;
	private String hotelAmenities;
	private String hotelImages;
}
