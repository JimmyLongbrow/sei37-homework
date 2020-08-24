var app = new Vue({
  el:'#app',
  data:{
    product: 'Bondi',
    description: 'Combining the science of Australias most authentic native essences with centuries of expertise in the art of perfume making, our perfumes created Downunder, are a quest to establish our unique Australian roots.',
    image: './assets/bondi2.jpg',
    link: 'https://www.goldfieldandbanks.com/collections/full-collection',
    inventory: 10,
    onSale: true,
    details: ["Marine","Citrus","Musky","Woody"],
    variants: [
      {
        variantId: 333,
        variantColor: "aqua",
        variantImage: "./assets/bondi.jpg",
        variantCart: 0
      }
      // {
      //   variantId: 111,
      //   variantColor: "palegreen",
      //   variantImage: "./assets/coralsea.jpg",
      //   variantCart: 0
      // },
      // {
      //   variantId: 222,
      //   variantColor: "pink",
      //   variantImage: "./assets/pinklake.jpg",
      //   variantCart: 0
      // },
      // {
      //   variantId: 444,
      //   variantColor: "darkorange",
      //   variantImage: "./assets/uluru.jpg",
      //   variantCart: 0
      // }

    ],
    sizes: ["100ml"],
    cart: 0
  },
  methods: {
    addToCart: function () {
      this.cart += 1
    },
    removeFromCart: function () {
      this.cart -= 1
    },
    updateProduct: function (variantImage) {
      this.image = variantImage
    }
  }
})
