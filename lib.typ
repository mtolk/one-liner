#let fit-to-width(max-text-size: auto, min-text-size: 4pt, it) = context {
  let effective-max-text-size = if max-text-size == auto { 
			text.size * 3
		} else { 
			max-text-size 
		}

  let contentsize = measure(it)
  layout(size =>{
	if contentsize.width > 0pt { // Prevent failure on empty content 
		let ratio-x = size.width/contentsize.width
		let ratio-y = size.height/contentsize.height
		let ratio = if ratio-x < ratio-y {
				ratio-x	
			} else {
				ratio-y
			}
		
		let newx = contentsize.width*ratio
		let newy = contentsize.height*ratio
		let suggestedtextsize = 1em*ratio
		if (suggestedtextsize + 0pt).to-absolute() > effective-max-text-size {
		  suggestedtextsize = effective-max-text-size
		}
		if (suggestedtextsize + 0pt).to-absolute() < min-text-size {
		  suggestedtextsize = min-text-size
		}
		set text(size:suggestedtextsize)
		it
	}
    
  })
}
