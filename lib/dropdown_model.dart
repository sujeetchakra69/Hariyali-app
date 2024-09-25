import 'package:flutter/material.dart';
import 'data.dart';

class MunicipalityDropdown extends StatelessWidget {
  final String? selectedProvince;
  final String? selectedDistrict;
  final String? selectedMunicipality;
  final ValueChanged<String?> onProvinceChanged;
  final ValueChanged<String?> onDistrictChanged;
  final ValueChanged<String?> onMunicipalityChanged;

  const MunicipalityDropdown({
    super.key,
    required this.selectedProvince,
    required this.selectedDistrict,
    required this.selectedMunicipality,
    required this.onProvinceChanged,
    required this.onDistrictChanged,
    required this.onMunicipalityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder()
          ),
          hint: const Text('Select Province'),
          value: selectedProvince,
          items: municipalityData.keys.map((String province) {
            return DropdownMenuItem<String>(
              value: province,
              child: Text(province),
            );
          }).toList(),
          onChanged: (newValue1) {
            onProvinceChanged(newValue1);
            // Reset district and municipality when province changes
            onDistrictChanged(null);
            onMunicipalityChanged(null);
          },
        ),
        const SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder()
          ),
          hint: const Text('Select District'),
          value: selectedDistrict,
          items: selectedProvince != null
              ? municipalityData[selectedProvince]!.keys.map((String district) {
                  return DropdownMenuItem<String>(
                    value: district,
                    child: Text(district),
                  );
                }).toList()
              : null,
          onChanged: (newValue2) {
            onDistrictChanged(newValue2);
            // Reset municipality when district changes
            onMunicipalityChanged(null);
          },
        ),
        const SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder()
          ),
          hint: const Text('Select Municipality'),
          value: selectedMunicipality,
          items: selectedDistrict != null && selectedProvince != null
              ? municipalityData[selectedProvince]![selectedDistrict]!
                  .map((String municipality) {
                  return DropdownMenuItem<String>(
                    value: municipality,
                    child: Text(municipality),
                  );
                }).toList()
              : null,
          onChanged: onMunicipalityChanged,
        ),
      ],
    );
  }
}
