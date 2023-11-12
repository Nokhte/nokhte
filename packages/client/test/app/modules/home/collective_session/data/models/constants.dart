import 'package:nokhte/app/modules/collective_session/types/types.dart';

class Constants {
  static get tPerspectives => ['pERSPECTIVE1', 'peRSPECTIVE2', 'perSPECTIVE3'];
  static get tPerspectiveMetadata => [
        {
          "thePerspective": tPerspectives[0],
          "numberOfFiles": 2,
        },
        {
          "thePerspective": tPerspectives[1],
          "numberOfFiles": 3,
        },
        {
          "thePerspective": tPerspectives[2],
          "numberOfFiles": 0,
        },
      ];
  static get tPerspectivesFileNames => [
        const FullAndRelativePath(
          fullPath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/pERSPE0/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_one.wav',
          relativePath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/pERSPE0/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_one.wav',
        ),
        const FullAndRelativePath(
          fullPath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/pERSPE0/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_two.wav',
          relativePath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/pERSPE0/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_two.wav',
        ),
        const FullAndRelativePath(
          fullPath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_one.wav',
          relativePath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_one.wav',
        ),
        const FullAndRelativePath(
          fullPath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_two.wav',
          relativePath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_two.wav',
        ),
        const FullAndRelativePath(
          fullPath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_three.wav',
          relativePath:
              'c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_three.wav',
        ),
      ];
  static get tInput => PathsAndSessionMetadata(
        fullAndRelativePaths: tPerspectivesFileNames,
        individualSessionMetadata: tPerspectiveMetadata,
      );
  static get expected => [
        CollaboratorPerspectivesData(
            thePerspective: "pERSPECTIVE1",
            numberOfFiles: 2,
            pathsToFiles: const [
              "c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/pERSPE0/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_one.wav",
              "c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/pERSPE0/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_two.wav"
            ]),
        CollaboratorPerspectivesData(
            thePerspective: "peRSPECTIVE2",
            numberOfFiles: 3,
            pathsToFiles: const [
              "c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_one.wav",
              "c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_two.wav",
              "c1e1b4b1-4a05-45d4-9015-468711f277a0_4a8e9dc9-d2e0-45a5-8dd1-d32f0c6d95c7/perspectives_2023-11-12:8:53/session_2023-11-12_8:32/peRSPE1/c1e1b4b1-4a05-45d4-9015-468711f277a0/c1e1b4b1-4a05-45d4-9015-468711f277a0_three.wav"
            ]),
        CollaboratorPerspectivesData(
            thePerspective: "perSPECTIVE3",
            numberOfFiles: 0,
            pathsToFiles: const [])
      ];
}
