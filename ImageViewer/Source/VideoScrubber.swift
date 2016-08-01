//
//  VideoScrubber.swift
//  ImageViewer
//
//  Created by Kristian Angyal on 29/07/2016.
//  Copyright © 2016 MailOnline. All rights reserved.
//

import UIKit

public class VideoScrubber: UIControl {

    let playButton = UIButton.playButton(width: 40, height: 20)
    let pauseButton = UIButton.pauseButton(width: 40, height: 20)
    let scrubber = UISlider.createSlider(320, height: 20, pointerDiameter: 10, barHeight: 5)
    let timeLabel = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 50, height: 20)))

    override init(frame: CGRect) {

        super.init(frame: frame)

        self.clipsToBounds = true

        pauseButton.hidden = true

        scrubber.minimumValue = 0
        scrubber.maximumValue = 300

        scrubber.value = 100

        timeLabel.attributedText = NSAttributedString(string: "03:26", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)])
        timeLabel.textAlignment =  .Center

        self.addSubviews(playButton, pauseButton, scrubber, timeLabel)
    }

    @available (*, unavailable)
    public required init?(coder aDecoder: NSCoder) { fatalError() }

    public override func layoutSubviews() {
        super.layoutSubviews()

        playButton.center = self.boundsCenter
        playButton.frame.origin.x = 0
        pauseButton.frame = playButton.frame

        timeLabel.center = self.boundsCenter
        timeLabel.frame.origin.x = self.bounds.maxX - timeLabel.bounds.width

        scrubber.bounds.size.width = self.bounds.width - playButton.bounds.width - timeLabel.bounds.width
        scrubber.bounds.size.height = 20
        scrubber.center = self.boundsCenter
        scrubber.frame.origin.x = playButton.frame.maxX
    }
}