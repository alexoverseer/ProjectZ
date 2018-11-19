import UIKit

extension SolarSystemViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.planetOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlanetCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        let planetOption = interactor.planetOptions[indexPath.row]
        cell.populate(with: planetOption)
        
        return cell
    }
}

extension SolarSystemViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = interactor.planetOptions.map { $0.isSelected = false }
        interactor.planetOptions[indexPath.row].isSelected = true
        interactor.setNewPlanetType(for: indexPath.row)
        planetsCollectionView.reloadData()
        planetsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension SolarSystemViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / CGFloat(PlanetCellSizeGuide.itemsPerWidth),
                      height: collectionView.frame.height - CGFloat(PlanetCellSizeGuide.offset))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return CGFloat(PlanetCellSizeGuide.itemSpacing)
    }
}
