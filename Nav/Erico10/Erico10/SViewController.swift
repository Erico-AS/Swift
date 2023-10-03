
import UIKit

class SViewController: UIViewController {

    public var email : Email?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPara.text = "\(email?.para)"
        lblAssunto.text = "\(email?.assunto)"
        lblMenssagem.text = "\(email?.menssagem)"
    }
}
