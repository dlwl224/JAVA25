package thisisjava_appendix_javafx;



import javafx.application.Application;
import javafx.application.Platform;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class AppMain extends Application{
	
	public AppMain() {
		System.out.println(Thread.currentThread().getName()+"AppMain() 호출");
	}
	
	@Override
	public void init() throws Exception {
		System.out.println(Thread.currentThread().getName() +" : init 호출");
	}
	public void  start(Stage arg0) throws Exception{
		System.out.println(Thread.currentThread().getName()+ " : start() 호출");
		VBox root= new VBox();
		root.setPrefWidth(350);
		root.setPrefHeight(150);
		root.setAlignment(Pos.CENTER);
		root.setSpacing(20);
		
		Label label= new Label();
		label.setText("Hello JavaFX");
		label.setFont(new Font(50));
		
		Button button = new Button();
		button.setText("확인");
		button.setOnAction(event -> Platform.exit());
		
		root.getChildren().add(label);
		root.getChildren().add(button);
		root.getChildren().add(new Button("추가했습니다."));
		root.getChildren().add(new Label("글자입니다."));
		
		Scene scene = new Scene(root);
		
		arg0.setTitle("AppMain");
		arg0.setScene(scene);
		
		arg0.show();
	}
	
	@Override
	public void stop() throws Exception {
		System.out.println(Thread.currentThread().getName()+" : stop() 호출");
	}
	public static void main(String[] args) {
		
		launch(args);
		
	}
	
	

}
