package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class Restaurant_each_day {
	
	private long packId;
	private long dayNumber;
	private long restaurantId;
}
