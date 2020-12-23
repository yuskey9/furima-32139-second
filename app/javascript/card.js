const pay = () => {
  Payjp.setPublicKey("pk_test_a276633f6d2220a31dc7cec1"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("orderer[card_number]"),
      exp_month: formData.get("orderer[card_exp_month]"),
      exp_year: `20${formData.get("orderer[card_exp_year]")}`,
      cvc: formData.get("orderer[card_cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);