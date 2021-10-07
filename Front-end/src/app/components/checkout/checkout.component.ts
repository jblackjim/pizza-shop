import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { City } from 'src/app/common/city';
import { EcommerceFormService } from 'src/app/services/ecommerce-form.service';
import { Municipality } from 'src/app/common/municipality';
import { PizzaPlanetValidators } from 'src/app/validators/pizza-planet-validators';
import { CartService } from 'src/app/services/cart.service';
import { CheckoutService } from 'src/app/services/checkout.service';
import { Router } from '@angular/router';
import { Order } from 'src/app/common/order';
import { OrderItem } from 'src/app/common/order-item';
import { Purchase } from 'src/app/common/purchase';

@Component({
selector: 'app-checkout',
templateUrl: './checkout.component.html',
styleUrls: ['./checkout.component.css'],
})
export class CheckoutComponent implements OnInit {
  checkoutFormGroup: FormGroup;

  totalPrice: number = 0;
  totalQuantity: number = 0;

  //creditCard: number=0;

  creditCardYears: number[] = [];
  creditCardMonths: number[] = [];

  city: City[] = [];
  shippingAddressMunicipalities: Municipality[] = [];
  billingAddressMunicipalities: Municipality[] = [];

  constructor(
    private formBuilder: FormBuilder,
    private ecommerceFormService: EcommerceFormService,
    private cartService: CartService,
    private checkoutService:CheckoutService,
    private router:Router
  ) {}

  ngOnInit(): void {

    this.reviewCartDetails();

    this.checkoutFormGroup = this.formBuilder.group({
      customer: this.formBuilder.group({
        firstName: new FormControl('',[Validators.required, Validators.minLength(2),PizzaPlanetValidators.notOnlyWhiteSpace]),
        lastName: new FormControl('',[Validators.required, Validators.minLength(2),PizzaPlanetValidators.notOnlyWhiteSpace]),
        email: new FormControl('',[Validators.required, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
        telephone: new FormControl('',[Validators.required, Validators.pattern('[0-9]{10,14}')])
      }),
      shippingAddress: this.formBuilder.group({
        street: new FormControl('',[Validators.required, Validators.minLength(2),PizzaPlanetValidators.notOnlyWhiteSpace]),
        city: new FormControl('',[Validators.required]),
        municipal: new FormControl('',[Validators.required]),
        zipCode: new FormControl('',[Validators.required, Validators.pattern('[0-9]{5}')])
      }),
      billingAddress: this.formBuilder.group({
        street: new FormControl('',[Validators.required, Validators.minLength(2),PizzaPlanetValidators.notOnlyWhiteSpace]),
        city: new FormControl('',[Validators.required]),
        municipal: new FormControl('',[Validators.required]),
        zipCode: new FormControl('',[Validators.required, Validators.pattern('[0-9]{5}')])
      }),
      creditCard: this.formBuilder.group({
        cardType: new FormControl('',[Validators.required]),
        nameOnCard: new FormControl('',[Validators.required, Validators.minLength(2),PizzaPlanetValidators.notOnlyWhiteSpace]),
        cardNumber: new FormControl('',[Validators.required, Validators.pattern('[0-9]{16}')]),
        securityCode: new FormControl('',[Validators.required, Validators.pattern('[0-9]{3}')]),
        expirationMonth: [''],
        expirationYear: [''],
      }),
    });

    //populate credit card months

    const startMonth: number = new Date().getMonth() + 1;
    console.log('starMonth: ' + startMonth);

    this.ecommerceFormService
      .getCreditCardMonths(startMonth)
      .subscribe((data) => {
        console.log('Retrived credi card months: ' + JSON.stringify(data));
        this.creditCardMonths = data;
      });

    //populate credit card years

    this.ecommerceFormService.getCreditCardYears().subscribe((data) => {
      console.log('Retrived credit card years: ' + JSON.stringify(data));
      this.creditCardYears = data;
    });

    //populate city
    this.ecommerceFormService.getCity().subscribe(
      (data) => {
        console.log("Retrieved city: " + JSON.stringify(data));
        this.city = data;
    }
    
  );
  }
  reviewCartDetails() {
    this.cartService.totalQuantity.subscribe(
      totalQuantity => this.totalQuantity = totalQuantity
     );


     //subscribe to cartsService.totalPrice

   this.cartService.totalPrice.subscribe(
     totalPrice => this.totalPrice = totalPrice
   );
  }

  get firstName(){ return this.checkoutFormGroup.get('customer.firstName'); }
  get lastName(){ return this.checkoutFormGroup.get('customer.lastName'); }
  get email(){ return this.checkoutFormGroup.get('customer.email'); }
  get telephone(){ return this.checkoutFormGroup.get('customer.telephone'); }

  get shippingAddressStreet(){ return this.checkoutFormGroup.get('shippingAddress.street'); }
  get shippingAddressCity(){ return this.checkoutFormGroup.get('shippingAddress.city'); }
  get shippingAddressMunicipal(){ return this.checkoutFormGroup.get('shippingAddress.municipal'); }
  get shippingAddressZipcode(){ return this.checkoutFormGroup.get('shippingAddress.zipCode'); }

  get billingAddressStreet(){ return this.checkoutFormGroup.get('billingAddress.street'); }
  get billingAddressCity(){ return this.checkoutFormGroup.get('billingAddress.city'); }
  get billingAddressMunicipal(){ return this.checkoutFormGroup.get('billingAddress.municipal'); }
  get billingAddressZipcode(){ return this.checkoutFormGroup.get('billingAddress.zipCode'); }

  get creditCardType(){ return this.checkoutFormGroup.get('creditCard.cardType'); }
  get creditCardNameOnCard(){ return this.checkoutFormGroup.get('creditCard.nameOnCard'); }
  get creditCardNumber(){ return this.checkoutFormGroup.get('creditCard.cardNumber'); }
  get creditCardSecurityCode(){ return this.checkoutFormGroup.get('creditCard.securityCode'); }

  copyShippingAddressToBillingAddress(event) {
    
    if (event.target.checked) {
      this.checkoutFormGroup.controls.billingAddress.setValue(
        this.checkoutFormGroup.controls.shippingAddress.value
      );
    } else {
      this.checkoutFormGroup.controls.billingAddress.reset();
    }
  }

    onSubmit() {
      console.log('Handling the submit Button');
      if(this.checkoutFormGroup.invalid){
        this.checkoutFormGroup.markAllAsTouched();
        return;
      }
      
        let order = new Order();
        order.totalPrice = this.totalPrice;
        order.totalQuantity = this.totalQuantity;


        const cartItems = this.cartService.cartItems;

        // let orderItems: OrderItem[]=[];
        // for (let i=0; i< cartItems.length;i++){
        //   orderItems[i] = new OrderItem(cartItems[i]);
        // }


        let orderItems: OrderItem[] = cartItems.map(tempCartItem => new OrderItem(tempCartItem));

        let purchase = new Purchase();

        //populate purchase - customer
        purchase.customer = this.checkoutFormGroup.controls['customer'].value;



        // populate purchase - shipping address
        purchase.shippingAddress = this.checkoutFormGroup.controls['shippingAddress'].value;
        const shippingCity: City = JSON.parse(JSON.stringify(purchase.shippingAddress.city));
        const shippingMunicipal: Municipality = JSON.parse(JSON.stringify(purchase.shippingAddress.municipal));
        purchase.shippingAddress.city= shippingCity.name;
        purchase.shippingAddress.municipal= shippingMunicipal.name;

        // populate purchase - billing address
        purchase.billingAddress = this.checkoutFormGroup.controls['billingAddress'].value;
        const billingCity: City = JSON.parse(JSON.stringify(purchase.billingAddress.city));
        const billingMunicipal: Municipality = JSON.parse(JSON.stringify(purchase.billingAddress.municipal));
        purchase.billingAddress.city= shippingCity.name;
        purchase.billingAddress.municipal= shippingMunicipal.name;

        //populate purchase - order - order Items
        purchase.order = order;
        purchase.orderItems = orderItems;

        //call Rest API

        this.checkoutService.placeOrder(purchase).subscribe(
          {
            next: response =>{
              alert(`Your order has been received.\nOrder tracking number: ${response.orderTrackingNumber}`);

              this.resetCart();
            },
            error: err =>{
              alert(`There was an error: ${err.message}`);
            }
          }

        );

      }
  resetCart() {
    
    this.cartService.cartItems =[];
    this.cartService.totalPrice.next(0);
    this.cartService.totalQuantity.next(0);
    //reset the form
    this.checkoutFormGroup.reset();
    //navigate back to products page
    this.router.navigateByUrl("/products");
  }
      
  
    handleMonthsAndYears() {

    const creditCardFormGroup = this.checkoutFormGroup.get('creditCard');
    const currentYear: number = new Date().getFullYear();
    const selectedYear: number = Number(creditCardFormGroup?.value.expirationYear);
    //if the current year equals the selected year then star with current month!

    let startMonth: number;

    if (currentYear === selectedYear) {
      startMonth = new Date().getMonth() + 1;
    } else {
      startMonth = 1;
    }
    this.ecommerceFormService
      .getCreditCardMonths(startMonth)
      .subscribe((data) => {
        console.log('Retrived credit card months: ' + JSON.stringify(data));
        this.creditCardMonths = data;
      });
  }

  getMunicipalities(formGroupName: string){

    const formGroup = this.checkoutFormGroup.get(formGroupName);
    const cityCode = formGroup?.value.city.code;
    const cityName = formGroup?.value.city.name;

    console.log(`${formGroupName} country code: ${cityCode}`);
    console.log(`${formGroupName} country code: ${cityName}`);

    this.ecommerceFormService.getMunicipalities(cityCode).subscribe(
      data=> {

        if (formGroupName ==='shippingAddress'){
          this.shippingAddressMunicipalities = data;

        } 
        else{
          this.billingAddressMunicipalities = data;
        }
        //select the first Municipality by default
        formGroup?.get('municipal')?.setValue(data[0]);
      }
    )
  } 
}