package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ItemWrapper {
    private Object item;
    private String type;
}
