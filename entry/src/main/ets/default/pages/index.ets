@Entry
@Component
struct Index {
  @State historyArr: string[] = ["Text", "Button", "TextField", "Image", "Switch", "Checkbox", "RadioButton", "ProgressBar", "ScrollView"]
  build() {
    Column() {
      Search_Input({historyArr: $historyArr})
      Flexlayout_Container({historyArr:$historyArr})
    }
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
struct Search_Input {
  @State historyInput: string = ''
  @Link historyArr: string[]
  build() {
    Flex({ alignItems: ItemAlign.Center }) {
      TextInput({ placeholder: '请输入...', text: this.historyInput })
        .type(InputType.Normal)
        .placeholderColor(Color.Red)
        .placeholderFont({ size: 25, weight: 2 })
        .enterKeyType(EnterKeyType.Search)
        .caretColor(Color.Green)
        .layoutWeight(8)
        .height(40)
        .borderRadius('20px')
        .backgroundColor(Color.White)
        .onChange((value: string) => {
          this.historyInput = value
        })
      Button({ type: ButtonType.Capsule, stateEffect: false }) {
        Text('搜索')
          .fontWeight(17)
          .fontColor(Color.Blue)
      }
      .onClick((event: ClickEvent) => {
        if (this.historyInput != null && this.historyInput.length > 0) {
          this.historyArr.unshift(this.historyInput)
          this.historyInput = ''
        }
      })
      .layoutWeight(2)
      .backgroundColor('#00000000')

    }
    .height(60)
    .padding({ left: 10 })
    .backgroundColor('#FFedf2f5')
  }
}

@Component
struct Flexlayout_Container{
  @Link historyArr:string[]
  build() {
    Scroll() {
      Flex({justifyContent:FlexAlign.Start,wrap:FlexWrap.Wrap}) {
        if (this.historyArr.length > 0) {
          ForEach(this.historyArr,
            (item: string) => {
              Text(`${item}`)
                .fontSize(18)
                .borderStyle(BorderStyle.Solid)
                .borderWidth('1px')
                .borderColor('#dddddd')
                .borderRadius('90px')
                .padding({top: 4, bottom: 4, right: 10, left: 10})
                .margin({top: 10, right: 10})
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .maxLines(2)
            },
            (item: string) => item.toString()
          )
        }
      }
      .margin({left:20,bottom:100,right:10})
      .padding({bottom:10})
    }
  }
}
