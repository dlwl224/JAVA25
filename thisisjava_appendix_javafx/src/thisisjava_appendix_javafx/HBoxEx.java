package thisisjava_appendix_javafx;

import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;

public class HBoxEx extends Application{
	public void start(Stage arg0) throws Exception{
		HBox hbox= new HBox();
		hbox.setPadding(new Insets(10,10,10 ,10));
		hbox.setSpacing(10);
		
		TextField textField = new TextField();
		textField.setPrefWidth(200);
		
		Button button = new Button("확인");
		
		ObservableList list= hbox.getChildren();
		list.add(textField);
		list.add(button);
		
		Scene scene = new Scene(hbox);
		
		
		arg0.setTitle("HBox 연습:");
		arg0.setScene(scene);
		arg0.show();
		}
	
	public static void main(String[] args) {
		launch(args);
	}

}
