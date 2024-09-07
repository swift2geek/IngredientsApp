import UIKit
import IngredientsFramework

class IngredientsViewController: UIViewController {

    @IBOutlet weak var firstIngredient: UITextField!
    @IBOutlet weak var secondIngredient: UITextField!
    @IBOutlet weak var thirdIngredient: UITextField!


    @IBAction func onCheckIngredientsPressed(_ sender: Any) {
        let checker = IngredientsChecker()

        let ingredient1 = checker.checkFirstIngredient(withName: firstIngredient.text ?? "")
        let ingredient2 = checker.checkSecondIngredient(withName: secondIngredient.text ?? "")
        let ingredient3 = checker.checkThirdIngredient(withName: thirdIngredient.text ?? "")

        updateColor(textField: firstIngredient, color: ingredient1 ? UIColor.green : UIColor.red)
        updateColor(textField: secondIngredient, color: ingredient2 ? UIColor.green : UIColor.red)
        updateColor(textField: thirdIngredient, color: ingredient3 ? UIColor.green : UIColor.red)
    }

    private func updateColor(textField: UITextField, color: UIColor) {
        textField.backgroundColor = color
    }
}
