package travel.project.domain;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class RestaurantView {
	private long restaurantId;
	private long destinationId;
	private String destinationName;
	private String country;
	private String destinationDescription;
	private String restaurantName;
	private String cuisine;
	private String restaurantDescription;
	private String restaurantImages;
	
}
