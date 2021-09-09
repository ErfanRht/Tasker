import 'package:get/get.dart';
import 'package:todo/controllers/new-task/newtask-controller.dart';

class NewTaskAnimationsController extends GetxController {
  double closeButtonOpacity = 0;
  double textFieldOpacity = 0;
  double box1Opacity = 0;
  double box2Opacity = 0;
  double addButtonOpacity = 0;

  updateAnimations(
      {double newCloseButtonOpacity,
      double newTextFieldOpacity,
      double newBox1Opacity,
      double newBox2Opacity,
      double newAddButtonOpacity}) {
    closeButtonOpacity = newCloseButtonOpacity != null
        ? newCloseButtonOpacity
        : closeButtonOpacity;
    textFieldOpacity =
        newTextFieldOpacity != null ? newTextFieldOpacity : textFieldOpacity;
    box1Opacity = newBox1Opacity != null ? newBox1Opacity : box1Opacity;
    box2Opacity = newBox2Opacity != null ? newBox2Opacity : box2Opacity;
    addButtonOpacity =
        newAddButtonOpacity != null ? newAddButtonOpacity : addButtonOpacity;
    update();
  }
}

startAnimations() async {
  await Future.delayed(Duration(milliseconds: 250));
  Get.find<NewTaskAnimationsController>()
      .updateAnimations(newCloseButtonOpacity: 1);
  await Future.delayed(Duration(milliseconds: 250));
  Get.find<NewTaskAnimationsController>()
      .updateAnimations(newTextFieldOpacity: 1);
  await Future.delayed(Duration(milliseconds: 250));
  Get.find<NewTaskAnimationsController>().updateAnimations(newBox1Opacity: 1);
  Get.find<NewTaskAnimationsController>().updateAnimations(newBox2Opacity: 1);
  await Future.delayed(Duration(milliseconds: 750));
  Get.find<NewTaskAnimationsController>()
      .updateAnimations(newAddButtonOpacity: 1);
}
